<?php
class Logout extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		session_start();
	}

	function index()
	{
		// セッションを解放
		session_unset();
		session_destroy();
	  
		// 念のため新しいセッションIDを振り直す
		session_regenerate_id(true);

		// トップへ
		redirect('/');
	}
}
