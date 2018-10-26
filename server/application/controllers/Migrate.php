<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migrate extends CI_Controller {

	function __construct()
	{   
		parent::__construct();
		$this->load->library('migration');
	}

    function current()
    {   
        if ($this->migration->current()) {
            echo 'OK';
        } else {
            echo $this->migration->error_string();
        }   
    }   

    function rollback($version)
    {   
        if ($this->migration->version($version)) {
            echo 'OK';
        } else {
            echo $this->migration->error_string();
        }   
    }   

    function latest()
    {   
        if ($this->migration->latest()) {
            echo 'OK';
        } else {
            echo $this->migration->error_string();
        }   
    }

}