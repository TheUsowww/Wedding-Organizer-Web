<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if (!function_exists('kirim_email')) {
    function kirim_email($to, $subject, $message) {
        $CI =& get_instance();
        $CI->load->library('email');

        $CI->email->from('your_email@example.com', 'Wedding Organizer');
        $CI->email->to($to);
        $CI->email->subject($subject);
        $CI->email->message($message);

        if ($CI->email->send()) {
            log_message('info', 'Email berhasil dikirim ke: ' . $to);
            return true;
        } else {
            log_message('error', 'Gagal mengirim email ke: ' . $to . '. Error: ' . $CI->email->print_debugger());
            return false;
        }
    }
}