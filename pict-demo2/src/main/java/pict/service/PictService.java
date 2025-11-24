/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package pict.service;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface PictService {
	public List<?> schedule_list(PictVO pictVO) throws Exception;

    public List<?> schedule_list_day(PictVO pictVO) throws Exception;

	public PictVO schedule_list_one(PictVO pictVO) throws Exception;

	public void schedule_update(PictVO pictVO) throws Exception;

	public void schedule_insert(PictVO pictVO) throws Exception;

	public void schedule_delete(PictVO pictVO) throws Exception;

    public List<?> today_list(PictVO pictVO) throws Exception;

    public PictVO today_list_one(PictVO pictVO) throws Exception;

    public void today_update(PictVO pictVO) throws Exception;

    public void today_insert(PictVO pictVO) throws Exception;

    public void today_delete(PictVO pictVO) throws Exception;

    public List<?> review_list(PictVO pictVO) throws Exception;

    public PictVO review_list_one(PictVO pictVO) throws Exception;

    public void review_update(PictVO pictVO) throws Exception;

    public void review_insert(PictVO pictVO) throws Exception;

    public void review_delete(PictVO pictVO) throws Exception;


    public List<?> popup_list(PictVO pictVO) throws Exception;

    public PictVO popup_list_one(PictVO pictVO) throws Exception;

    public void popup_update(PictVO pictVO) throws Exception;

    public void popup_insert(PictVO pictVO) throws Exception;

    public void popup_delete(PictVO pictVO) throws Exception;

    void user_insert(PictVO pictVO) throws Exception;
}
