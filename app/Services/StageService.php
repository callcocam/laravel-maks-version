<?php


namespace App\Services;


use App\Provider;
use App\Stage;

class StageService
{
    /**
     * @var Stage
     */
    private $stage;

    /**
     * StageSevice constructor.
     * @param Stage $stage
     */
    public function __construct(Provider $stage)
    {
        $this->stage = $stage;
    }

    public function load($rows){

        $stages = $this->stage->orderBy('ordering','DESC')->get();
        $Inputs = [];
        if($stages){

            foreach ($stages as $stage) {

                $Input = $stage->input($rows);
                if($Input)
                  $Inputs[] = $stage;
            }
        }

        if($Inputs)
            return $Inputs;

        $Inputs[] = $this->stage->orderBy('ordering','ASC')->first();

            return $Inputs;
    }
}
