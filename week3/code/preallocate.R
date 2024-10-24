# Function that demonstrates the effect of not preallocating a vector
NoPreallocFun = function(x){
    a = vector() #empty vecotr
    for(i in 1:x) {
        a = c(a,i) #concatenate
        print(a) # Print the current state of the vector
        print(object.size(a)) # Print the memory size of the vector
    }
}

# Measure the time taken to execute the NoPreallocFun with input 10
system.time(NoPreallocFun(10))

PreallocFun = function(x){
    a = rep(NA,x) #pre-allocated vector
    for(i in 1:x){
        a[i] = i
        print(a)
        print(object.size(a))
    }
}

# Measure the time taken to execute the PreallocFun with input 10
system.time(PreallocFun(10))