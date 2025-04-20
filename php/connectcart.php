<?php
// connectcart.php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "registration";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get the raw POST data
$rawData = file_get_contents('php://input');
$cartItems = json_decode($rawData, true);

// Log the received data to a file
file_put_contents('php://stderr', print_r($cartItems, true));

// Generate a unique order ID for each cart submission
$order_id = uniqid('order_', true);

foreach ($cartItems as $item) {
    $name = $item['name'];
    $desc = $item['desc'];
    $img = $item['img'];
    $price = $item['price'];
    $quantity = $item['quantity'];

    $stmt = $conn->prepare("INSERT INTO cartdata (order_id, name, description, image, price, quantity) VALUES (?, ?, ?, ?, ?, ?)");
    if ($stmt) {
        $stmt->bind_param("ssssdi", $order_id, $name, $desc, $img, $price, $quantity);

        if ($stmt->execute() === TRUE) {
            echo "New record created successfully with order ID: " . $order_id;
        } else {
            error_log("Execute failed: " . $stmt->error);
            echo "Error: " . $stmt->error;
        }
        $stmt->close();
    } else {
        error_log("Prepare failed: " . $conn->error);
        echo "Error: " . $conn->error;
    }
}

$conn->close();
?>
