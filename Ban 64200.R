set.seed(123)  # For reproducibility

# Step 1: Generate a list of workers with basic info
workers <- data.frame(
  id = 1:400,
  name = paste("Worker", 1:400, sep = "_"),
  gender = sample(c("male", "female"), 400, replace = TRUE),
  salary = sample(5000:30000, 400, replace = TRUE)
)

# Step 2: Generate payment slips and set employee levels based on conditions
for (i in 1:nrow(workers)) {
  tryCatch({
    # Extract worker info
    worker <- workers[i, ]
    employee_level <- "General"  # Default level
    
    # Apply conditions for employee level
    if (worker$salary > 10000 && worker$salary < 20000) {
      employee_level <- "A1"
    } else if (worker$salary > 7500 && worker$salary < 30000 && worker$gender == "female") {
      employee_level <- "A5-F"
    }
    
    # Print payment slip
    cat("Payment Slip for", worker$name, "(ID:", worker$id, ")\n")
    cat("  Gender:", worker$gender, "\n")
    cat("  Salary: $", worker$salary, "\n")
    cat("  Employee Level:", employee_level, "\n")
    cat("------------------------------\n")
  }, error = function(e) {
    cat("Error processing worker ID:", workers[i, "id"], ":", e$message, "\n")
  })
}
