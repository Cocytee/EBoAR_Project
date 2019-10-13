#MAIN FILE 
#---------------------------------------------------------------------

#Cores Files and Variables that are necessary for the software to run.
CoreFiles = ["Directories.txt","TOOLS.jl","CAL.jl","CMP.jl"]
#Packages needed.
packages_list = []

#List of dir that allow the soft to know where are the usefull things
#Format : "Thing" => "Where it is"
Dir = Dict{String,String}()

#---------------------------------------------------------------------
"""
	\tCheckFiles()\n
	\t\tReturn Boolean
Internal Function that check Core Files.\n
"""
function CheckFiles()
	#Check if the Cores Files are inside the current directory
	OK_array = map(x->(isfile(x)||isdir(x)),CoreFiles)
	#Total True == Number of Files ?
	if(sum(OK_array) == length(CoreFiles))
		println("Yes. ",sum(OK_array),"/",length(CoreFiles)," core files in the directory")
	else
		println("Warning, missing files !")
		for i in 1:length(OK_array)
			if(OK_array[i] == false)
				println("\t-> "*CoreFiles[i])
			end
		end
		return false
	end
	return true
end
#---------------------------------------------------------------------
function LoadDir()
	#Take the paths inside Directories.txt and put them into Dir
	open(CoreFiles[1],"r") do d_file
		while ((!eof(d_file))&&isreadable(d_file))
			(k,v) = split(readline(d_file))
			if(isdir(v))
				Dir[k] = v
				println(k*" @ "*v)
			else
				println("\t->"*v*" is not a valid Directory")
				return false
			end
		end
	end
	return true
end
#---------------------------------------------------------------------

# INIT 							~~~~~~~~~~~~~~~~~~
println("\n---  P R O G R A M    S T A R T S  ---")
println("\nEveryones here ? ")
while(secure(CheckFiles()))end

include("TOOLS.jl")
include("CAL.jl")

println("\nLoading Packages...")
while(secure(CheckPkg(packages_list)))end

println("\nLoading DirectoryFile...")
while(secure(LoadDir()))end

println("\nLoading CalibrationFile...")
while(secure(LoadCal("Calibration.txt")))end

# COMPONENTS DATABASE BUILDING 	~~~~~~~~~~~~~~~~~~

# HARDWARE CONNECTIONS 			~~~~~~~~~~~~~~~~~~

# SESSION BUILD 				~~~~~~~~~~~~~~~~~~

# CALIBRATE 					~~~~~~~~~~~~~~~~~~

# EXTRACTION CHOICES 			~~~~~~~~~~~~~~~~~~

# IMAGE GATHERING 				~~~~~~~~~~~~~~~~~~

# PRE-PROCESSING				~~~~~~~~~~~~~~~~~~

# PROCESSING (each comp, H&V)	~~~~~~~~~~~~~~~~~~

# POSITIONS REVIEW				~~~~~~~~~~~~~~~~~~

# SEND HARDWARE TASK			~~~~~~~~~~~~~~~~~~

# GATHER HARDWARE LOG			~~~~~~~~~~~~~~~~~~

# CLOSING 						~~~~~~~~~~~~~~~~~~
println("\n---  P R O G R A M    E N D I N G  ---")
