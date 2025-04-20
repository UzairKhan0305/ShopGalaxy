<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .container {
            margin-top: 20px;
        }
        .table img {
            width: 50px;
            height: 50px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Admin Panel</h2>

    <!-- Combined Data Table -->
    <h3>Combined Data Table</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Order ID</th>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Contact</th>
                <th>Address</th>
                <th>Country</th>
                <th>Name</th>
                <th>Description</th>
                <th>Image</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <?php
            // Connect to the database
            $conn = new mysqli('localhost', 'root', '', 'registration');
            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }

            // Perform a JOIN to combine data from registrationtable and cartdata based on matching order_id
            $sql = "SELECT r.order_id, r.ID, r.first_name, r.last_name, r.email, r.contact, r.address, r.country, 
                           c.name, c.description, c.image, c.price, c.quantity 
                    FROM registrationtable r
                    JOIN cartdata c ON r.order_id = c.order_id"; // Joining on order_id to get matching records

            // Debugging statement to check the SQL query
            echo "SQL Query: $sql <br>";

            $result = $conn->query($sql);

            // Debugging statement to check if any rows are returned
            if ($result && $result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $order_id = isset($row['order_id']) ? $row['order_id'] : '';
                    $id = isset($row['ID']) ? $row['ID'] : '';
                    $firstName = isset($row['first_name']) ? $row['first_name'] : '';
                    $lastName = isset($row['last_name']) ? $row['last_name'] : '';
                    $email = isset($row['email']) ? $row['email'] : '';
                    $contact = isset($row['contact']) ? $row['contact'] : '';
                    $address = isset($row['address']) ? $row['address'] : '';
                    $country = isset($row['country']) ? $row['country'] : '';
                    $name = isset($row['name']) ? $row['name'] : '';
                    $description = isset($row['description']) ? $row['description'] : '';
                    $price = isset($row['price']) ? $row['price'] : '';
                    $quantity = isset($row['quantity']) ? $row['quantity'] : '';

                    // Display image from BLOB data
                    $imgData = $row['image']; // Original BLOB data
                    if ($imgData) {
                        $imgBase64 = base64_encode($imgData);
                        $imgSrc = 'data:image/jpeg;base64,' . $imgBase64;
                    } else {
                        $imgSrc = ''; // Placeholder if no image data
                    }

                    echo "<tr>
                            <td>{$order_id}</td>
                            <td>{$id}</td>
                            <td>{$firstName}</td>
                            <td>{$lastName}</td>
                            <td>{$email}</td>
                            <td>{$contact}</td>
                            <td>{$address}</td>
                            <td>{$country}</td>
                            <td>{$name}</td>
                            <td>{$description}</td>
                            <td><img src='{$imgSrc}' alt='Product Image'></td>
                            <td>{$price}</td>
                            <td>{$quantity}</td>
                            <td><button class='btn btn-danger delete-btn' data-id='{$id}'>Delete</button></td>
                        </tr>";
                }
            } else {
                // Debugging statement to indicate no results
                echo "No records found with matching order_id";
            }

            $conn->close();
            ?>
        </tbody>
    </table>
</div>

<!-- jQuery for handling delete operations -->
<script>
    $(document).ready(function() {
        $('.delete-btn').click(function() {
            var id = $(this).data('id');
            $.ajax({
                url: 'delete.php',
                type: 'POST',
                data: { id: id },
                success: function(response) {
                    if (response === 'success') {
                        location.reload();
                    } else {
                        alert('Failed to delete record.');
                    }
                }
            });
        });
    });
</script>
</body>
</html>
