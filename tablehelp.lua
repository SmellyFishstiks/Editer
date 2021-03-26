

function addTo_Table(t,i,v)
 local l=#t-i+1
 
 
 for j=i,#t do
  
  t[i+l]=t[i+l-1]
  l=l-1
 end
 t[i]=v
 return t
end

function remove_Table(t,i)
 for j=i,#t do
  t[j]=t[j+1]
 end
 
 return t
end