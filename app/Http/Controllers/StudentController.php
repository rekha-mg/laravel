<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Http\Requests;



class StudentController extends Controller
{
    //
    public function sendResponse($success, $result, $message, $response_code)
    {
        $response = [
            'success' => true,
            'data'    => $result,
            'message' => $message,
        ];
        return response()->json($response, $response_code);
    }


    
    public function showAll(Request $request)
    {
        Log::info('Display all users: ');
        $limit = $request->query('limit', 200);
        try {
            $res = DB::select('select count(*) as total from users');
            Log::info('Total number of users' . $res[0]->total);
            $total_users = $res[0]->total;
            if ($total_users > $limit) {
                $user_list = DB::select('select * from users limit ?', [$limit]);
            } else {
                $user_list = DB::select('select *  from users');
            }
        } catch (\PDOException $pex) {
            Log::critical('some error: ' . print_r($pex->getMessage(), true)); //xampp off
            return $this->sendResponse("false", "", 'error related to database', 500);
            } catch (\Exception $e) {
                Log::critical('some error: ' . print_r($e->getMessage(), true));
                Log::critical('error line: ' . print_r($e->getLine(), true));
                return $this->sendResponse("false", "", 'some error in server', 500);
            }
            return $this->sendResponse("true", $user_list, 'request completed', 200);
    }

}
