"""
This script processes a tuple of bird species, where each entry contains the Latin name,
common name, and average body mass 
.
"""

birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
        )

# Print the information in birds on a separate line or output block by species 
for latin_name, common_name, mass in birds:
    print(f"Latin Name: {latin_name}, Common Name: {common_name}, Mass: {mass} g")
