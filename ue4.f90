program gowno

implicit none
include "fftw3.f"

integer *2 :: sample
integer :: i, y

double complex, dimension(450000) :: out_data
character*256 :: filename
integer*8 plan
double precision, dimension(450000) :: in_data

!input data to dble
open(1, file="sin.raw",FORM= 'UNFORMATTED' ,ACCESS= 'direct' ,RECL=2)

i=1
do
    read(1,rec=i,err=100)sample
    
    in_data(i) = dble(sample)
    !write(*,*)i,in_data(i)
    i=i+1
end do

close(1)
100 write(*,*)i-1, "samples"


!fourier out data
call dfftw_plan_dft_1d(plan,i,in_data,out_data,FFTW_FORWARD,FFTW_ESTIMATE)
call dfftw_execute_dft(plan, in_data, out_data)
call dfftw_destroy_plan(plan)

print*, size(out_data)

!plot data - spectrum
do y=1, i/2 + 1 

   print*, abs(out_data(y)), abs(out_data(y))**2
   
end do   




end program gowno
