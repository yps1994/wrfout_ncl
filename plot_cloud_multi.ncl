
;   Example script to produce plots for a WRF real-data run,
;   with the ARW coordinate dynamics option.

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"


loadscript ("./module_output_type.ncl")                 ;output setting for gsn_open_wks
loadscript ("./module_basemap_mpres.ncl")               ;mpres setting
loadscript ("./module_input_multi.ncl")                ;control input file setting

begin


  res = True
  pltres = True


  times = wrf_user_getvar(a[0],"times",-1)  ; get all times in the file
  ntimes = dimsizes(times)         ; number of times in the file

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  do it = ntimes-1,ntimes-1        ; TIME LOOP

    print("Working on time: " + times(it) )
    res@TimeLabel = times(it)   ; Set Valid time to use on plots

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; First get the variables we will need        

    if(isfilevar(a[0],"QVAPOR"))
      qv = wrf_user_getvar(a,"QVAPOR",it) 
      qv = qv*1000.
      qv@units = "g/kg"   
    end if
    if(isfilevar(a[0],"QCLOUD"))
      qc = wrf_user_getvar(a,"QCLOUD",it)
      qc = qc*1000.
      qc@units = "g/kg"   
    end if
    if(isfilevar(a[0],"QRAIN"))
      qr = wrf_user_getvar(a,"QRAIN",it)
      qr = qr*1000.
      qr@units = "g/kg"   
    end if
    if(isfilevar(a[0],"QICE"))
      qi = wrf_user_getvar(a,"QICE",it)
      qi = qi*1000.
      qi@units = "g/kg"   
    end if

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    do level = 0,24,5      ; LOOP OVER LEVELS

      wks = gsn_open_wks(type,"Cloud_" + sprinti("%03i",it) + "_Level_" + sprinti("%02i",level))
      gsn_define_colormap(wks,"WhBlGrYeRe")   ; overwrite the .hluresfile color map

      display_level = level + 1
      opts = res
      opts@cnFillOn         = True
      opts@gsnSpreadColors  = False
      opts@PlotLevelID      = "Eta Level  " + display_level

      if (isvar("qv"))
        contour = wrf_contour(a[0],wks,qv(level,:,:),opts)
        plot = wrf_map_overlays(a[0],wks,(/contour/),pltres,mpres)
        delete(contour)
      end if

      if (isvar("qc"))
        contour = wrf_contour(a[0],wks,qc(level,:,:),opts)
        plot = wrf_map_overlays(a[0],wks,(/contour/),pltres,mpres)
        delete(contour)
      end if

      if (isvar("qr"))
        contour = wrf_contour(a[0],wks,qr(level,:,:),opts)
        plot = wrf_map_overlays(a[0],wks,(/contour/),pltres,mpres)
        delete(contour)
      end if

      if (isvar("qi"))
        qi_plane  = qi(level,:,:)
        contour = wrf_contour(a[0],wks,qi(level,:,:),opts)
        plot = wrf_map_overlays(a[0],wks,(/contour/),pltres,mpres)
        delete(contour)
      end if

      delete(opts)

    end do      ; END OF LEVEL LOOP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  end do        ; END OF TIME LOOP     

end