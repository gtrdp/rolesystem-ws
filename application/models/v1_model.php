<?php

class V1_model extends CI_Model {

	public function get_case()
	{
		return $this->db->get('tab_kasus');
	}

	public function get_ident_gejala($kasus_id = 0)
	{
		return $this->db->query("SELECT * FROM tab_role LEFT JOIN tab_gejala ON tab_gejala.gjl_id=tab_role.role_ident 
									WHERE role_kasus='$kasus_id' && role_start=1 ");
	}

	public function get_ident_gejala2($kasus_id = 0, $role_identnext = 0)
	{
		return $this->db->query("SELECT * FROM tab_role LEFT JOIN tab_gejala ON tab_gejala.gjl_id=tab_role.role_ident 
						WHERE role_kasus='$kasus_id' && role_start=0 && role_ident='$role_identnext' ");
	}

	public function get_diagnosis($role_identnext = 0)
	{
		return $this->db->query("SELECT * FROM tab_diag WHERE diag_id='$role_identnext'");
	}
}