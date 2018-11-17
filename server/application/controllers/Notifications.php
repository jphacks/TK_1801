<?php
class Notifications extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		session_start();
		
		if (!isset($_SESSION['user_id'])) {
			redirect('/login');
		}
	}

	function index()
	{
		if (!isset($_SESSION['user_id']) || ($this->user->count(array('id' => $_SESSION['user_id'])) === 0)) {
			redirect('/login');
		} else {
			$reviews = $this->guidance_review->search(
				'guidances.customer_user_id AS tourist_user_id, '.
				'users.name AS tourist_user_name, '.
				'guidance_reviews.body AS body, '.
				'guidance_reviews.created_at AS created_at',
				array('guidances.tourist_user_id' => $_SESSION['user_id']),
				null,
				null,
				null,
				null,
				true,
				true
			);
			$this->smarty->view('notifications.tpl', array(
				'user' => $this->user->get('*', array(
					'id' => $_SESSION['user_id'],
					'reviews' => $reviews,
				)),
			));
		}
	}
}
