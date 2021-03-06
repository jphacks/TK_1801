<?php
class Storage extends CI_Controller {

	function __construct()
	{
		parent::__construct();
	}

	function profile_image($user_id = 0)
	{
		header('Content-Type: image/jpeg');

		$user = $this->user->get('profile_image_filename', array('id' => $user_id));
		if ($user === false || !isset($user['profile_image_filename'])) {
			readfile(APPPATH.'../images/no_image.jpg');
		} else {
			// TODO: 変な値を入れられた時のセキュリティ対策
			readfile($user['profile_image_filename']);
		}
	}
}
