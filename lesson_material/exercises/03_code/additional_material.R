#############################
##### "turn around" data ####
#############################

# Load necessary library
library(tidyr)

# Example Dataset: Long Format
long_data <- data.frame(
  ID = c(1, 1, 2, 2),
  Time = c("Morning", "Evening", "Morning", "Evening"),
  Score = c(8, 6, 7, 9)
)

# Print the Long Format Data
print(long_data)

# Convert from Long to Wide
wide_data <- pivot_wider(long_data, names_from = Time, values_from = Score)

# Print the Wide Format Data
print(wide_data)

# Convert from Wide back to Long
long_data_reconstructed <- pivot_longer(wide_data, cols = c(Morning, Evening),
                                        names_to = "Time", values_to = "Score")

# Print the Reconstructed Long Format Data
print(long_data_reconstructed)

#############################
#### Combining datasets #####
#############################

# Example Dataset 1: Students Information
students <- data.frame(
  ID = c(1, 2, 3, 4),
  Name = c("Alice", "Bob", "Charlie", "David")
)

# Example Dataset 2: Scores
scores <- data.frame(
  ID = c(2, 3, 5),
  Score = c(85, 90, 78)
)

# Print the two datasets
print(students)

print(scores)

# LEFT JOIN: Keep all rows from 'students' and match 'scores'
left_join_result <- left_join(students, scores, by = "ID")
print(left_join_result)

# RIGHT JOIN: Keep all rows from 'scores' and match 'students'
right_join_result <- right_join(students, scores, by = "ID")
print(right_join_result)

# INNER JOIN: Keep only rows that have matching IDs in both datasets
inner_join_result <- inner_join(students, scores, by = "ID")
print(inner_join_result)

# FULL JOIN: Keep all rows from both datasets
full_join_result <- full_join(students, scores, by = "ID")
print(full_join_result)


#############################
##### Loops and if else #####
#############################

# If-else statement
a = 3
b = 4
if (a > b) {
  print("a is greater than b")
} else {
  print("b is greater than or equal to a")
}

# For loop
for (i in 1:5) {
  print(i)
}

# While loop
x <- 1
while (x <= 5) {
  print(x)
  x <- x + 1
}
