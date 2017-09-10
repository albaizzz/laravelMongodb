<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Students;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Collection;

class StudentapiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */ 
    public function index()
    {
        //
        $students = Students::all();
        return response()->json($students);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $data = $request->json()->all();
        $id = Students::orderBy('nis', 'desc')->first()->nis;
        $student = new Students;
        $student->nis = $id+1;
        $student->Name = $request->input("name");
        $student->Address = $request->input("address");
        $student->Gender = $request->input("gender");
        $student->save();
        return response()->json($student);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $data = $request->json()->all();
        $student = Students::where('nis', (int)$request->input("nis"))->first();
        $student->Name = $request->input("name");
        $student->Address = $request->input("address");
        $student->Gender = $request->input("gender");
        $student->save();
        return response()->json($student);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        // $data = $request->json()->all();
        $student = Students::where('nis', (int)$id)->first();
        $student->delete();
        return response()->json($student);
    }
}
