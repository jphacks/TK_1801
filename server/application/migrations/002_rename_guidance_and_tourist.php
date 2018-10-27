<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Rename_guidance_and_tourist extends CI_Migration {

	public function up()
	{
        $this->load->dbforge();
        $this->dbforge->rename_table('calls', 'guidances');
        $this->dbforge->rename_table('call_reviews', 'guidance_reviews');
        $this->dbforge->rename_table('customer_users', 'tourist_users');
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
EOS;
        $this->db->query($sql);

        $this->load->database();
        $this->db->query(
            "ALTER TABLE guidance_reviews ADD COLUMN guidance_id INTEGER NOT NULL DEFAULT 0;"
        );
	}

	public function down()
	{
        $this->load->dbforge();
        $this->dbforge->drop_table('guidance_reviews');
        $sql = <<<'EOS'
        CREATE TABLE IF NOT EXISTS call_reviews (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            star INTEGER NOT NULL CHECK(star >= 1 OR star <= 5),
            body TEXT NOT NULL, -- 本文
            created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            created_by_ip_address INTEGER NOT NULL
        );
EOS;
$this->db->query($sql);

        $this->dbforge->drop_table('users');
        $sql = <<<'EOS'
        CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            name TEXT NOT NULL,
            type TEXT NOT NULL CHECK(type IN ('customer', 'guide')),
            balance INTEGER NOT NULL DEFAULT 0, -- ポイント残高
            password_hash TEXT NOT NULL,
            created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            created_by_ip_address INTEGER NOT NULL
        );
EOS;
        $this->db->query($sql);

        $this->dbforge->rename_table('tourist_users', 'customer_users');
        $this->dbforge->rename_table('guidances', 'calls');
	}

}