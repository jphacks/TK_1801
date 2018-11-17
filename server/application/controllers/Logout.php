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

		// トップへ
		redirect('/');
	}
}
