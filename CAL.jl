#CALIBRATION FILE 
# Parameters used into the processing + Calibrations protocol functions
#---------------------------------------------------------------------

#List of Calibration Values, allow the soft to do EVERYTHING.
Cal = Dict{String,Int16}()
#Format : "CalibrationVar" => Value(Int16)

#coefR,coefG,coefB and bias are neural parameter to filter solder grey.
#density,order are paramters for the lowpass noise filter (after the RGBtoWHITE processing).
#spray is the amount of decimation to use while doing the AprxConv processing.
#match is the percentage needed to be considerer as a footprint after the Conv processing.
#t_OFF is the Temperature Offset for the (un)soldering iron.

#Default Calibration Values.
DefaultCal = Dict{String,Int16}("coefR"=>12,"coefG"=>12,"coefB"=>12,"bias"=>1,
"density"=>51,"order"=>3,"spray"=>2,"match"=>80,"t_OFF"=>0)

"""
	\tLoadCal(CalibrationFile::String)
	\t\tReturn Boolean
Check if there is EBoAR Calibration File corresponding to the specified argument.\n
If YES, the function will gather the parameters and put them into a "Cal" dictionnary variable.
If NO, the function will create a file corresponding to the specified argument and fill it with Default values.
Then, put theses values into the "Cal" variable.
"""
function LoadCal(adr::String)
	#search Calibration File ("Calibration.txt")  
	#If here, fill Cal with all the written values.
	#If missing, create it with default value into the current directory and fill Cal with default values.

	if(isfile(adr))
		println("Calibration file found.")
		open(adr,"r") do c_file
			while ((!eof(c_file))&&isreadable(c_file))
				(k,v) = split(readline(c_file))
				try
					Cal[k] = parse(Int16,v)
					println(k*" => "*v)
				catch
					println("\t -> Wrong number format (need Int16)")
					return false
				end
			end
		end
		return (keys(Cal)==keys(DefaultCal))
	else
		println("Calibration file no found.")
		println("Creating with default values...")
		open(adr,"w+") do c_file
			for k in keys(DefaultCal)
				try
					write(c_file,k*"\t\t"*string(DefaultCal[k])*"\n")
				catch
					println("Cannot write into calibration file !")
					return false
				end
			end
		end
		return true
	end
end