<?php
// Step 1: Connect to the database
$host = "localhost";
$username = "root";    // default XAMPP username
$password = "";        // default XAMPP password is empty
$database = "shopkeer_req";  // make sure this DB exists

// Create connection
$conn = new mysqli($host, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("❌ Connection failed: " . $conn->connect_error);
}

// Step 2: Get form data
$item_name   = $_POST['item_name'];
$item_code   = $_POST['item_code'];
$category    = $_POST['category'];
$quantity    = $_POST['quantity'];
$price       = $_POST['price'];
$supplier    = $_POST['supplier'];
$date_added  = $_POST['date_added'];

// Step 3: Insert data
$sql = "INSERT INTO inventory (item_name, item_code, category, quantity, price, supplier, date_added)
        VALUES (?, ?, ?, ?, ?, ?, ?)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("sssidsd", $item_name, $item_code, $category, $quantity, $price, $supplier, $date_added);

// Step 4: Execute and confirm
if ($stmt->execute()) {
    echo "<h3 style='color:green;'>✅ Item successfully added to inventory!</h3>";
    echo "<p><strong>Item:</strong> $item_name<br><strong>Code:</strong> $item_code</p>";
} else {
    echo "<h3 style='color:red;'>❌ Error:</h3> " . $stmt->error;
}

// Step 5: Close connection
$stmt->close();
$conn->close();
?>
