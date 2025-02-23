<?php

require_once('../tools/functions.php');
require_once('../classes/room-status.class.php');

//(class-details)room-id, subject-id, section-id, teacher-assigned, 
//(class-time)start-time, end-time, day
//
//this var refers to room_
$class_status_id = $class_id = $class_time_id= = $class_day_id = '';
$room_id = $subject_id = $section_id = $teacher_assigned = $start_time = $end_time = $day_id = '';
$room_idErr = $subject_idErr = $section_idErr = $teacher_assignedErr = $start_timeErr = $end_timeErr = $day_idErr = '';

$roomObj = new RoomStatus();

if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $class_status_id = clean_input($_POST['class-status-id']);
    $class_id = clean_input($_POST['class-id']);
    $class_time_id = clean_input($_POST['class-time-id']);
    $class_day_id = clean_input($_POST['class-day-id']);

    $room_id = clean_input($_POST['room-id']);
    $subject_id = clean_input($_POST['subject-id']);
    $section_id = clean_input($_POST['section-id']);
    $teacher_assigned = clean_input($_POST['teacher-assigned']);
    $start_time = clean_input($_POST['start-time']);
    $end_time = clean_input($_POST['end-time']);
    $day_id = isset($_POST['day-id']) ? $_POST['day-id'] : [];
    
    if(empty($room_id)){
        $room_idErr = 'Room is required.';
    } 

   
    if(empty($subject_id)){
        $subject_idErr = 'Subject is required.';
    }

    if(empty($section_id)){
        $section_idErr = 'Section is required.';
    }

    if(empty($teacher_assigned)){
        $teacher_assignedErr = 'Teacher is required.';
    }

    if(empty($start_time)){
        $start_timeErr = 'Start time is required is required.';
    }
    
    if(empty($end_time)){
        $end_timeErr = 'End time is required.';
    }

    if(!empty($start_time) && !empty($end_time)){
        if($start_time > $end_time){
            $start_timeErr = "Start time must be less than end time.";
        }
        elseif($start_time == $end_time){
            $start_timeErr = "Start time should not be the same as end time.";
            $end_timeErr = "End time should not be the same as start time.";
        }
    }

    
    if(!empty($day_id)){
        // Check each selected day for existing schedules
        foreach($day_id as $selected_day) {
            if($roomObj->classTimeExistsOnDay($class_id, $selected_day)) {
                $day_idErr = "This class already has a schedule on " . getDayName($selected_day);
                break;
            }
        }
    }
    


    // If there are validation errors, return them as JSON
    if(!empty($room_idErr) || !empty($subject_idErr) || !empty($section_idErr)  || !empty($teacher_assignedErr) || !empty($start_timeErr) || !empty($end_timeErr) || !empty($day_idErr)){
        echo json_encode([
            'status' => 'error',
            'room_idErr' => $room_idErr,
            'subject_idErr' => $subject_idErr,
            'section_idErr' => $section_idErr,
            'teacher_assignedErr' => $teacher_assignedErr,
            'start_timeErr' => $start_timeErr,
            'end_timeErr' => $end_timeErr,
            'day_idErr' => $day_idErr
        ]);
        exit;
    }

    $roomObj->class_status_id = $class_status_id;
    $roomObj->class_id = $class_id;
    $roomObj->room_id = $room_id;
    $roomObj->subject_id = $subject_id;
    $roomObj->section_id = $section_id;
    $roomObj->teacher_assigned = $teacher_assigned;
    $roomObj->class_time_id = $class_time_id;
    $roomObj->start_time = $start_time;
    $roomObj->end_time = $end_time;
    $roomObj->class_day_id = $class_day_id;
    $roomObj->day_id = $day_id;

    //count($day_id)

    if($roomObj->editroomStatus()){
        echo json_encode(['status' => 'success', 'debug' => [
            'class_id created' => $roomObj->log_cid,
            'class_time_id created' => $roomObj->log_ctid,
            'Day_id inserted' => $roomObj->log_day,
            'class_day_id created' => $roomObj->log_cdid
        ]]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Something went wrong when adding the new class status.']);
    }
    exit;

    
}

?>
