<?php
class Profile_image extends CI_Controller {

	function __construct()
	{
		parent::__construct();
	}

	function index($user_id = 0)
	{
		header('Content-Type: image/jpeg');

		$user = $this->user->get('profile_image_filename', array('id' => $_SESSION['user_id']));
		if ($user === false || !isset($user['profile_image_filename'])) {
			readfile('images/no_image.jpg');
		} else {
			// TODO: 変な値を入れられた時のセキュリティ対策
			readfile($user['profile_image_filename']);
		}
	}
}
