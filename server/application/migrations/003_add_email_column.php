<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_email_column extends CI_Migration {

	public function up()
	{
        $this->load->dbforge();
        $sql = "ALTER TABLE users ADD COLUMN email_address TEXT NOT NULL DEFAULT '';\nALTER TABLE users ADD COLUMN location TEXT NOT NULL DEFAULT '';";
        $this->db->query($sql);
        $this->dbforge->drop_table('tourist_users');
        $this->dbforge->drop_table('guide_users');
	}

	public function down()
	{
        $this->load->dbforge();
        $this->dbforge->drop_table('users');
        $sql = <<<'EOS'
        CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            name TEXT NOT NULL,
            type TEXT NOT NULL CHECK(type IN ('tourist', 'guide')),
            balance INTEGER NOT NULL DEFAULT 0, -- ポイント残高
            password_hash TEXT NOT NULL,
            created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            created_by_ip_address INTEGER NOT NULL
        );
        CREATE TABLE tourist_users (
            user_id INTEGER NOT NULL,
            country TEXT NOT NULL -- 出身国(「USA」などの自己申告制のテキスト)
        );
        CREATE TABLE guide_users (
            user_id INTEGER NOT NULL,
            location TEXT NOT NULL -- 居住地(「東京都新宿区」などの自己申告制のテキスト)
        );
EOS;
        $this->db->query($sql);
	}

}