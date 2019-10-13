#TOOLS FILE 
#Usefull function for the whole program
#---------------------------------------------------------------------

import Pkg

#---------------------------------------------------------------------
"""
	\tCheckPkg(PackagesList::Array{String})
	\t\tReturn Boolean
Check PackagesList to see if each specified package is already installed or not.\n
If not, the function will install the concerned package.
"""
function CheckPkg(p::Array{String})
	for i = 1:length(p)
		#Ctrl if the needed pkgs are arleady installed or not. DL if not.
		if(!haskey(Pkg.installed(), p[i]))
			println("* Installing "*p[i])
			if(Pkg.add(p[i]))
			else
				return false
			end
		else
			println("- "*p[i]*" already Installed")
		end
	end	
	return true
end
#---------------------------------------------------------------------
"""
	\tCheckFiles(FilesList::Array{String})\n
	\t\tReturn Boolean
Check FilesList to see if each one is into the current directory or not.\n
"""
function CheckFiles(fl::Array{String})
	OK_array = map(x->(isfile(x)||isdir(x)),fl)
	#Total True == Number of Files ?
	if(sum(OK_array) == length(fl))
		println(sum(OK_array),"/",length(fl),"  files in the directory")
	else
		println("Warning, missing files !")
		for i in 1:length(OK_array)
			if(OK_array[i] == false)
				println("\t-> "*fl[i])
			end
		end
		return false
	end
	return true
end

#---------------------------------------------------------------------
function secure(status::Bool)
	#Allow an error to raise without crashing the software.
	asw = ""
	if(!status)
		println("\nWould you like to solve the issue and (R)etry ? Or (E)xit the program ?")
		asw = chomp(readline())
		if((asw[1]=='R')||(asw[1]=='r'))
			return true
		else
			println("\n---  P R O G R A M    E N D I N G  ---")
			exit()
		end
	end
	return false
end
