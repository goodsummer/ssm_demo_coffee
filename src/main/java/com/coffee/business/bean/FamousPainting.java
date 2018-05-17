package com.coffee.business.bean;

import java.util.Date;

public class FamousPainting {
    private Integer id;

    private String url;

    private String name;

    private String author;

    private Integer looked;

    private String paintTime;

    private Date createtime;

    private Date updatetime;

    private String introduction;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPaintTime() {
		return paintTime;
	}

	public void setPaintTime(String paintTime) {
		this.paintTime = paintTime;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getAuthor() {
        return author;
    }

    public Integer getLooked() {
        return looked;
    }

    public void setLooked(Integer looked) {
        this.looked = looked;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

}