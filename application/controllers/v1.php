<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class V1 extends CI_Controller {

	public function v1()
	{
		parent::__construct();

		$this->load->library(array('input'));
		$this->load->helper(array('url'));
		$this->load->database();

		$this->load->model('v1_model');
	}

	/**
	 * Index Method
	 * @return [type] [description]
	 */
	public function index()
	{
		$result = $this->v1_model->get_case();

		$case = array();

		foreach ($result->result() as $row)
			$case[$row->kasus_id] = $row->kasus_judul;

		$output_json = array(	'status' => 'OK',
						'type'=> 'case-selection',
						'case' => $case);
		$this->output
		    ->set_content_type('application/json')
		    ->set_output(json_encode($output_json));
	}

	public function indent_gejala()
	{
		$kasus = $this->input->post('kasus');

		if($kasus == '') {
			$output_json = array(	'status' => 'error',
									'message'=> 'invalid argument');

			$this->output
			    ->set_content_type('application/json')
			    ->set_output(json_encode($output_json));
		} else {
			$result = $this->v1_model->get_ident_gejala($kasus);

			if($result->num_rows() > 0){
				$result = $result->row();

				$output_json = array(	'status' => 'OK',
								'type'=> 'question',
								'question' => $result->gjl_tanya,
								'kasusid' => $kasus,
								'role_identnext' => $result->role_identnext,
								'answer_identnext' => $result->answer_identnext,
								'ke' => 1);
				$this->output
				    ->set_content_type('application/json')
				    ->set_output(json_encode($output_json));
			}else{
				$output_json = array(	'status' => 'error',
										'message'=> 'kasus ID doesn\'t exist');

				$this->output
				    ->set_content_type('application/json')
				    ->set_output(json_encode($output_json));
			}
		}
	}

	public function indent_gejala2()
	{
		$this->load->library('form_validation');

		$this->form_validation->set_rules('jawaban', 'jawaban', 'required');
		$this->form_validation->set_rules('kasusid', 'Kasus ID', 'required');
		$this->form_validation->set_rules('role_identnext', 'role_identnext', 'required');
		$this->form_validation->set_rules('answer_identnext', 'answer_identnext', 'required');
		$this->form_validation->set_rules('ke', 'ke', 'required');

		$this->form_validation->set_error_delimiters('', '');


		if($this->form_validation->run() == FALSE) {
			$output_json = array(	'status' => 'error',
									'message'=> validation_errors());

			$this->output
			    ->set_content_type('application/json')
			    ->set_output(json_encode($output_json));
		} else {
			$jawaban = $this->input->post('jawaban');
			$kasusid = $this->input->post('kasusid');
			$role_identnext = $this->input->post('role_identnext');
			$answer_identnext = $this->input->post('answer_identnext');
			$ke = $this->input->post('ke');

			if($answer_identnext == 0) {
				// question
				$result = $this->v1_model->get_ident_gejala2($kasusid, $role_identnext);

				if($result->num_rows() > 0){
					$result = $result->row();

					$output_json = array(	'status' => 'OK',
									'type'=> 'question',
									'question' => $result->gjl_tanya,
									'kasusid' => $kasusid,
									'role_identnext' => $result->role_identnext,
									'answer_identnext' => $result->answer_identnext,
									'ke' => $ke+1);
					$this->output
					    ->set_content_type('application/json')
					    ->set_output(json_encode($output_json));
				}else{
					$output_json = array(	'status' => 'error',
											'message'=> 'kasus ID doesn\'t exist');

					$this->output
					    ->set_content_type('application/json')
					    ->set_output(json_encode($output_json));
				}
			}elseif($answer_identnext == 1){
				// diagnosis
				$result = $this->v1_model->get_diagnosis($role_identnext);

				if($result->num_rows() > 0){
					$result = $result->row();

					$output_json = array(	'status' => 'OK',
									'type'=> 'diagnosis',
									'diagnosis' => $result->diag_hasil,
									'saran' => $result->diag_saran);
					$this->output
					    ->set_content_type('application/json')
					    ->set_output(json_encode($output_json));
				}else{
					$output_json = array(	'status' => 'error',
											'message'=> 'kasus ID doesn\'t exist');

					$this->output
					    ->set_content_type('application/json')
					    ->set_output(json_encode($output_json));
				}
			}else{
				// error
				$output_json = array(	'status' => 'error',
										'message'=> 'Invalid answer_identnext.');

				$this->output
				    ->set_content_type('application/json')
				    ->set_output(json_encode($output_json));
			}
		}
	}
}

/* End of file v1.php */
/* Location: ./application/controllers/v1.php */