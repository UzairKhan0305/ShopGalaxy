<?php
// Database configuration
$servername = "localhost";
$username = "root";
$password = ''; // Use your MySQL root password
$dbname = "registration";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form data
$first_name = $_POST['first_name'];
$last_name = $_POST['last_name'];
$email = $_POST['email'];
$contact = $_POST['contact'];
$address = $_POST['address'];
$country = $_POST['country'];



// Insert data into database
$sql = "INSERT INTO registrationtable (first_name, last_name, email, contact, address, country)
        VALUES ('$first_name', '$last_name', '$email','$contact','$address','$country')";

if ($conn->query($sql) === TRUE) {
    // Get the order_id of the last inserted record
    $last_id = $conn->insert_id;
    $result = $conn->query("SELECT order_id FROM registrationtable WHERE ID = $last_id");
    $row = $result->fetch_assoc();
    $order_id = $row['order_id'];
    
    // Create an alert with the order_id and redirect to index.html
    echo "<script>
            alert('Order ID: $order_id is successfully ordered, We will  redirect you soon!');
            window.location.href = '../index.html';
          </script>";
} else {
    // Display error message on failure
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Close connection
$conn->close();
?>
