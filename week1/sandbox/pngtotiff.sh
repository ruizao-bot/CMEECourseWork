for f in *.png; 
    do  
        echo "Converting $f"; 
        convert "$f"  "$(basename "$f" .png).tif"; 
    done
