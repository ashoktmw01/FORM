<?php
// Step 1: Connect to the database
$host = "localhost";
$username = "root";       // default for XAMPP
$password = "";           // default is empty in XAMPP
$database = "passenger_reserv";

// Create connection
$conn = new mysqli($host, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("❌ Connection failed: " . $conn->connect_error);
}

// Step 2: Retrieve form data
$fullname      = $_POST['fullname'];
$passport      = $_POST['passport'];
$age           = $_POST['age'];
$gender        = $_POST['gender'];
$email         = $_POST['email'];
$phone         = $_POST['phone'];
$source        = $_POST['source'];
$destination   = $_POST['destination'];
$journey_date  = $_POST['journey_date'];
$class         = $_POST['class'];
$seats         = $_POST['seats'];

// Step 3: Insert data into the passengers table
$sql = "INSERT INTO passenger (fullname, passport, age, gender, email, phone, source, destination, journey_date, class, seats)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

// Prepare statement
$stmt = $conn->prepare($sql);
$stmt->bind_param("ssisssssssi", $fullname, $passport, $age, $gender, $email, $phone, $source, $destination, $journey_date, $class, $seats);

// Execute
if ($stmt->execute()) {
    echo "<h2 style='color:green;'>✅ Reservation Successful!</h2>";
    echo "<p>Thank you, <strong>$fullname</strong>. Your flight has been booked.</p>";
} else {
    echo "<h2 style='color:red;'>❌ Error:</h2> " . $stmt->error;
}

// Close connections
$stmt->close();
$conn->close();
?>
