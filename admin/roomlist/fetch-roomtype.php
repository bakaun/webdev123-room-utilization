<?php
    require_once('../../classes/room.class.php');

    $roomObj = new Room();

    $room_type = $roomObj->fetchroomType();

    header('Content-Type: application/json');
    echo json_encode($room_type);

?>
