<?php
if (isset($_GET['uid'])) {
    $e_id = '.' . $_GET['uid'];
} else {
    $e_id = now();
}
$success = false;
$success = mail('php'.$e_id .'@7-Iron', 'Test from email_test.php id:'.$e_id, 'Hello');
if ($success) {
    echo 'Success: Email sent with this unique id - '.$e_id;
} else {
    echo 'Fail: The email was not sent.';
}
