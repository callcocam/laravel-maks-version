<?php
/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */

namespace App;

use App\Suports\Call\Resources\Fields\Facades\COVER;
use App\Suports\Call\Resources\Fields\Facades\ID;
use App\Suports\Call\Resources\Fields\Facades\TEXT;
use App\Suports\Shinobi\Concerns\HasRolesAndPermissions;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Client extends Model
{
    use HasRolesAndPermissions, TraitModel, TraitTable;

    protected $table ='users';

    public $incrementing = false;

    protected $keyType = "string";
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name','slug', 'fantasy','phone','document','email', 'password', 'is_admin', 'description',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token','email_verified_at'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->defaultOptions['endpoint'] = "clients";
        $this->defaultOptions['title'] = "Clientes";
        $this->headers = [
            ID::make('id')->hiddenList()->hiddenShow()->render(),
            COVER::make('cover')->render(),
            TEXT::make('name')->filter()->render(),
        ];
    }
    public function address(){

        return $this->morphOne(Addres::class, 'addresable');
    }

    public function roles(): BelongsToMany
    {
        return $this->belongsToMany(config('shinobi.models.role'), 'role_user', 'user_id', 'role_id')->withTimestamps();
    }

    public function orders(){

        return $this->hasMany(Order::class);
    }


    public function ordersProduct(){

        $orders = $this->hasMany(Order::class)->get();

        $products = [];

        foreach ($orders as $order) {

            $items = $order->items()->get();

            foreach ($items as $item) {

                $product = $item->products()->first();

                $products[$product->id] = $product;
            }
        }

        return $products;
    }

    public function getAddressAttribute(){

        return $this->address()->first(['zip','city','state','country', 'street','district','number','complement']);
    }

    public function getBonificationAttribute(){


        $Bonifications = $this->hasMany(Bonification::class, 'client_id')->where('status','published')->get();

        if(!$Bonifications->count())
            return false;

        return $Bonifications;

    }

    public function init()
    {
        // TODO: Implement init() method.
    }

    public function initFilter($query)
    {
        // TODO: Implement initFilter() method.
    }
}
