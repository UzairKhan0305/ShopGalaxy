<?php
// delete.php

if (isset($_POST['id'])) {
    $id = $_POST['id'];

    // Connect to the database
    $conn = new mysqli('localhost', 'root', '', 'registration');
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Delete records from both tables
    $stmt1 = $conn->prepare("DELETE FROM registrationtable WHERE ID = ?");
    $stmt1->bind_param("i", $id);
    $stmt2 = $conn->prepare("DELETE FROM cartdata WHERE ID = ?");
    $stmt2->bind_param("i", $id);

    if ($stmt1->execute() && $stmt2->execute()) {
        echo "success";
    } else {
        echo "error";
    }

    $stmt1->close();
    $stmt2->close();
    $conn->close();
}
?>
