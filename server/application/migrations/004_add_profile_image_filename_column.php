<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_profile_image_filename_column extends CI_Migration {

	public function up()
	{
        $this->load->dbforge();
        $sql = "ALTER TABLE users ADD COLUMN profile_image_filename TEXT";
        $this->db->query($sql);
	}

	public function down()
	{
        exit('Not supported!');
	}

}