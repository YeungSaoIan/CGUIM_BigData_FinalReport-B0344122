AsiaMapvisitor <- get_map(location = "Asia", zoom = 3, maptype = 'satellite',language = "zh-TW")
AsiaMapvisitorO <- ggmap(AsiaMapvisitor)+ geom_point(data=asiavisitordata, 
                                                     aes(x=as.numeric(locationx), y=as.numeric(locationy),
                                                         color=as.numeric(asiavisitordata$"count2016"),size=3.5))+ 
  scale_color_continuous(
    low = "yellow",high = "red")+ 
  guides(size=FALSE)
AsiaMapvisitorO

EuroMapvisitor <- get_map(location = "Europe", zoom = 3, maptype = 'satellite')
EuroMapvisitorO <- ggmap(EuroMapvisitor)+ geom_point(data=eurovisitordata, 
                                                     aes(x=as.numeric(locationx), y=as.numeric(locationy),
                                                         color=as.numeric(X100to105v1$"count2016"),size=3.5))+ 
  scale_color_continuous(
    low = "yellow",high = "red")+ 
  guides(size=FALSE)
EuroMapvisitorO

OceaniaMapvisitor <- get_map(location = "Oceania", zoom = 3, maptype = 'satellite')
OceaniaMapvisitorO <- ggmap(OceaniavisitorMap)+ geom_point(data=Oceaniavisitordata, 
                                                           aes(x=as.numeric(locationx), y=as.numeric(locationy),
                                                               color=as.numeric(X100to105v1$"count2016"),size=3.5))+ 
  scale_color_continuous(
    low = "yellow",high = "red")+ 
  guides(size=FALSE)
OceaniaMapvisitorO

AfricaMapvisitor <- get_map(location = "Africa", zoom = 3, maptype = 'satellite')
AfricaMapvisitorO <- ggmap(AfricavisitorMap)+ geom_point(data=SAfricavisitordata, 
                                                         aes(x=as.numeric(locationx), y=as.numeric(locationy),
                                                             color=as.numeric(X100to105v1$"count2016"),size=3.5))+ 
  scale_color_continuous(
    low = "yellow",high = "red")+ 
  guides(size=FALSE)
AfricaMapvisitorO

NAMapvisitor <- get_map(location = "North America", zoom = 3, maptype = 'satellite')
NAMapvisitorO <- ggmap(NAvisitorvisitorMap)+ geom_point(data=NAvisitordata, 
                                                        aes(x=as.numeric(locationx), y=as.numeric(locationy),
                                                            color=as.numeric(X100to105v1$"count2016"),size=3.5))+ 
  scale_color_continuous(
    low = "yellow",high = "red")+ 
  guides(size=FALSE)
NAvisitorMapO

SAMapvisitor <- get_map(location = "South America", zoom = 3, maptype = 'satellite')
SAMapvisitorO <- ggmap(SAMap)+ geom_point(data=SAvisitordata, 
                                          aes(x=as.numeric(locationx), y=as.numeric(locationy),
                                              color=as.numeric(X100to105v1$"count2016"),size=3.5))+ 
  scale_color_continuous(
    low = "yellow",high = "red")+ 
  guides(size=FALSE)
SAvisitorMapO