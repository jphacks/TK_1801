<?php
class Setting extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		session_start();
	}

	function index()
	{
		$this->smarty->view('setting.tpl', array(
            'user' => $this->user->get('*', array('id' => $_SESSION['user_id'])),
        ));
	}
}