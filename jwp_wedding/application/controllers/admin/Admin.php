<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('pesanan_model');
        $this->load->helper('email');
    }

    public function approve_pesanan($id) {
        // Logika yang sudah ada untuk menyetujui pesanan
        $result = $this->pesanan_model->approve_pesanan($id);

        if ($result) {
            $pesanan = $this->pesanan_model->get_pesanan($id);
            $to = $pesanan->email_pembeli;
            $subject = "Pesanan Anda Telah Disetujui";
            $message = "Selamat! Pesanan Anda dengan ID {$id} telah disetujui.";

            if (kirim_email($to, $subject, $message)) {
                $this->session->set_flashdata('success', 'Pesanan disetujui dan email dikirim ke pembeli.');
            } else {
                $this->session->set_flashdata('warning', 'Pesanan disetujui tetapi gagal mengirim email.');
            }
        } else {
            $this->session->set_flashdata('error', 'Gagal menyetujui pesanan.');
        }

        redirect('admin/pesanan');
    }

    public function reject_pesanan($id) {
        // Logika yang sudah ada untuk menolak pesanan
        $result = $this->pesanan_model->reject_pesanan($id);

        if ($result) {
            $pesanan = $this->pesanan_model->get_pesanan($id);
            $to = $pesanan->email_pembeli;
            $subject = "Status Pesanan Anda";
            $message = "Maaf, pesanan Anda dengan ID {$id} tidak dapat kami proses saat ini.";

            if (kirim_email($to, $subject, $message)) {
                $this->session->set_flashdata('success', 'Pesanan ditolak dan email dikirim ke pembeli.');
            } else {
                $this->session->set_flashdata('warning', 'Pesanan ditolak tetapi gagal mengirim email.');
            }
        } else {
            $this->session->set_flashdata('error', 'Gagal menolak pesanan.');
        }

        redirect('admin/pesanan');
    }
}