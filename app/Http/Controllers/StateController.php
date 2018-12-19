<?php

namespace App\Http\Controllers;

use App\Models\State;
use Illuminate\Http\Request;

class StateController extends Controller
{
    /**
     * StateController constructor.
     */
    public function __construct() { }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function createState(Request $request)
    {
        $state = new State();
        $state = $state->createState($request);

        return response()->json($state[0], $state[1]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function readStates(Request $request)
    {
        $state  = new State();
        $states = $state->readStates($request);

        $headers = [
            'X-Total-Count' => $states['total']
        ];

        return response()->json($states['data'], $states['status'], $headers);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function readState(Request $request, $id)
    {
        $state = new State();
        $state = $state->readState($request, $id);

        return response()->json($state[0], $state[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function editState(Request $request, $id)
    {
        $state = new State();
        $state = $state->editState($request, $id);

        return response()->json($state[0], $state[1]);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function deleteState(Request $request, $id)
    {
        $state = new State();
        $state = $state->deleteState($request, $id);

        return response()->json($state[0], $state[1]);
    }

}
