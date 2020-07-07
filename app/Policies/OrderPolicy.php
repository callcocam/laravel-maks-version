<?php

namespace App\Policies;

use App\Order;
use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class OrderPolicy
{
    use HandlesAuthorization;


    /**
     * Determine whether the user can view any orders.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function viewAny(User $user)
    {
        //
    }

    /**
     * Determine whether the user can view the order.
     *
     * @param \App\User $user
     * @param Order $order
     * @return mixed
     */
    public function view(User $user, Order $order)
    {
        if($user->hasAnyRole('funcionarios')){
            return true;
        }
        return $user->id == $order->responsible_id;
    }

    /**
     * Determine whether the user can create orders.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function create(User $user)
    {
        //
    }

    /**
     * Determine whether the user can update the order.
     *
     * @param \App\User $user
     * @param Order $order
     * @return mixed
     */
    public function update(User $user, Order $order)
    {
        if($user->hasAnyRole('funcionarios')){
            return true;
        }

        return $user->id == $order->responsible_id;
    }

    /**
     * Determine whether the user can delete the order.
     *
     * @param \App\User $user
     * @param Order $order
     * @return mixed
     */
    public function delete(User $user, Order $order)
    {
        if($user->hasAnyRole('funcionarios')){
            return true;
        }
        return $user->id == $order->responsible_id;
    }

    /**
     * Determine whether the user can restore the order.
     *
     * @param \App\User $user
     * @param Order $order
     * @return mixed
     */
    public function restore(User $user, Order $order)
    {
        if($user->hasAnyRole('funcionarios')){
            return true;
        }
        return $user->id == $order->responsible_id;
    }

    /**
     * Determine whether the user can permanently delete the order.
     *
     * @param \App\User $user
     * @param Order $order
     * @return mixed
     */
    public function forceDelete(User $user, Order $order)
    {
        if($user->hasAnyRole('funcionarios')){
            return true;
        }
        return $user->id == $order->responsible_id;
    }
}
