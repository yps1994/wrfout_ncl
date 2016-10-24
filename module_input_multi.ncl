load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

begin

  ListOfFiles = systemfunc("ls ./wrfout/d04_20100713_ACM2/wrfout_d04*")
  a = addfiles(ListOfFiles, "r")
  ListSetType(a, "cat")

end
