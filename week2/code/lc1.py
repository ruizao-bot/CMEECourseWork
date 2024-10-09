birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
         )

#(1) Write three separate list comprehensions that create three different
# lists containing the latin names, common names and mean body masses for
# each species in birds, respectively. 
# Assuming each dictionary in the 'birds' list has keys 'latin_name', 'common_name', and 'mean_body_mass'

# 1. List comprehension for latin names
latin_names = [bird[0] for bird in birds]
print(latin_names)

# 2. List comprehension for common names
common_names = [bird[1] for bird in birds]
print(common_names)
# 3. List comprehension for mean body masses
mean_body_masses = [bird[2] for bird in birds]
print(mean_body_masses)
# (2) Now do the same using conventional loops (you can choose to do this 
# before 1 !). 

# Step #1: Dispaly latin names
latin_names = ""
for bird in birds:
    latin_names +=bird[0] + ","
latin_names = latin_names.rstrip(",")
print(f"Latin names:{latin_names}")

# Step #2: Display common names
common_names = ""
for bird in birds:
    common_names +=bird[1] + ","
common_names = common_names.rstrip(",")
print(f"Common names:{common_names}")

# Step #3: Display their mean body masses
mean_body_masses = ""
for bird in birds:
    mean_body_masses +=str(bird[2]) + ","
mean_body_masses = mean_body_masses.rstrip(",")
print(f"Mean body masses:{mean_body_masses}")

 