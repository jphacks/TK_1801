<?php
class Mypage extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		session_start();
	}

	function index()
	{
		if (!isset($_SESSION['user_id']) || ($this->user->count(array('id' => $_SESSION['user_id'])) === 0)) {
			redirect('/login');
		} else {
			$review_info = $this->guidance_review->get(
				'AVG(guidance_reviews.star) AS star_avg',
				array('guidances.guide_user_id' => $_SESSION['user_id']),
				null,
				null,
				null,
				null,
				true,
				false
			);
			$this->smarty->view('mypage.tpl', array(
				'user' => $this->user->get('*', array('id' => $_SESSION['user_id'])),
				'star_avg' => $review_info['star_avg'],
			));
		}
	}
}
