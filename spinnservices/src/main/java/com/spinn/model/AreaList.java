package com.spinn.model;


import io.swagger.annotations.ApiModelProperty;

import org.springframework.data.annotation.PersistenceConstructor;
import org.springframework.data.mongodb.core.index.IndexDirection;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import com.querydsl.core.annotations.QueryEntity;

@QueryEntity
@Document(collection = "arealist")
public class AreaList {

	@Indexed(direction = IndexDirection.ASCENDING)
    @ApiModelProperty(notes = "area", required = true)
    private String area;

    public AreaList() {}
 
    @PersistenceConstructor
	public AreaList(String area) {
		super();
		this.area = area;
	}

	/**
	 * @return the area
	 */
	public String getArea() {
		return area;
	}

	/**
	 * @param area the area to set
	 */
	public void setArea(String area) {
		this.area = area;
	}

}
