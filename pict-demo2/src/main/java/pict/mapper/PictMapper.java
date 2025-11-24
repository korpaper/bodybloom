/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
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
package pict.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import pict.service.PictVO;

@Mapper
public interface PictMapper {

	List<?> schedule_list(PictVO pictVO) throws Exception;

    List<?> schedule_list_day(PictVO pictVO) throws Exception;

	PictVO schedule_list_one(PictVO pictVO) throws Exception;

	void schedule_update(PictVO pictVO) throws Exception;

	void schedule_insert(PictVO pictVO) throws Exception;

	void schedule_delete(PictVO pictVO) throws Exception;


    List<?> today_list(PictVO pictVO) throws Exception;

    PictVO today_list_one(PictVO pictVO) throws Exception;

    void today_update(PictVO pictVO) throws Exception;

    void today_insert(PictVO pictVO) throws Exception;

    void today_delete(PictVO pictVO) throws Exception;

    List<?> review_list(PictVO pictVO) throws Exception;

    PictVO review_list_one(PictVO pictVO) throws Exception;

    void review_update(PictVO pictVO) throws Exception;

    void review_insert(PictVO pictVO) throws Exception;

    void review_delete(PictVO pictVO) throws Exception;

    List<?> popup_list(PictVO pictVO) throws Exception;

    PictVO popup_list_one(PictVO pictVO) throws Exception;

    void popup_update(PictVO pictVO) throws Exception;

    void popup_insert(PictVO pictVO) throws Exception;

    void popup_delete(PictVO pictVO) throws Exception;

    void user_insert(PictVO pictVO) throws Exception;

}
