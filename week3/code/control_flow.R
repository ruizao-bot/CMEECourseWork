# Assigning TRUE to variable 'a'
a = TRUE

# Checking if 'a' is TRUE
if (a == TRUE){
    # Print statement if 'a' is TRUE
    print("a is TRUE")
} else{
    # Print statement if 'a' is FALSE
    print("a is FLASE")
}

# Generating a random number between 0 and 1
z = runif(1)

# Check if the random number 'z' is less than or equal to 0.5
if (z <= 0.5) {
    # Print statement if 'z' is less than or equal to 0.5
    print("Less than a half")}

# Loop from 1 to 10
for(i in 1:10){
    j = i*i
    print(paste(i,"sqaured is", j))
}

# Loop through a list of bird species
for(species in c('Heliodoxa rubinoides', 
                 'Boissonneaua jardini', 
                 'Sula nebouxii')) {
      print(paste('The species is', species))
}

# Defining a vector with three string elements
v1 = c("a", "bc", "def")
for (i in v1){
    print(i)
}

i = 0
# A while loop that continues as long as 'i' is less than 10
while(i < 10){
    i = i+1
    print(i^2)
}