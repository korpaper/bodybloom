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
package pict.service.impl;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pict.mapper.PictMapper;
import pict.service.PictService;
import pict.service.PictVO;


@Service
public class PictServiceImpl implements PictService {

	@Autowired
    PictMapper pictMapper;

	@Override
	public List<?> schedule_list(PictVO pictVO) throws Exception {
		return pictMapper.schedule_list(pictVO);
	}

    @Override
    public List<?> schedule_list_day(PictVO pictVO) throws Exception {
        return pictMapper.schedule_list_day(pictVO);
    }

	@Override
	public PictVO schedule_list_one(PictVO pictVO) throws Exception {
		return pictMapper.schedule_list_one(pictVO);
	}

	@Override
	public void schedule_update(PictVO pictVO) throws Exception {
		pictMapper.schedule_update(pictVO);
	}

	@Override
	public void schedule_insert(PictVO pictVO) throws Exception {
		pictMapper.schedule_insert(pictVO);
	}

    @Override
    public void schedule_save(PictVO pictVO) throws Exception {
        boolean hasEtc  = "Y".equals(pictVO.getImpossible()) || "Y".equals(pictVO.getPossible());

        // 1️⃣ 기존 etc가 있는 경우 → 무조건 update
        if (pictVO.getEtcidx() != null && !"".equals(pictVO.getEtcidx())) {
            System.out.println("여기 이티시 업데이트");
            pictMapper.schedule_etc_update(pictVO);
        }
        // 2️⃣ 기존 etc 없고, 새로 예외 생긴 경우 → insert
        else if (hasEtc) {
            System.out.println("여기 이티시 인서트");
            pictMapper.schedule_etc_insert(pictVO);
        }

        pictMapper.schedule_update(pictVO);
    }

    private void insertIfNotExists(LocalDate date, PictVO pictVO) throws Exception {

        Map<String, Object> param = new HashMap<>();
        param.put("targetdate", date.toString());
        param.put("targettime", pictVO.getTargettime());
        param.put("userid", pictVO.getUserid());
        int cnt = pictMapper.selectScheduleCount(param);

        if (cnt == 0) {
            pictVO.setTargetdate(date.toString());
            pictMapper.schedule_insert(pictVO);
        }
    }

	@Override
	public void schedule_delete(PictVO pictVO) throws Exception {
		pictMapper.schedule_delete(pictVO);
	}


    @Override
    public List<?> today_list(PictVO pictVO) throws Exception {
        return pictMapper.today_list(pictVO);
    }

    @Override
    public PictVO today_list_one(PictVO pictVO) throws Exception {
        return pictMapper.today_list_one(pictVO);
    }

    @Override
    public void today_update(PictVO pictVO) throws Exception {
        pictMapper.today_update(pictVO);
    }

    @Override
    public void today_insert(PictVO pictVO) throws Exception {
        pictMapper.today_insert(pictVO);
    }

    @Override
    public void today_delete(PictVO pictVO) throws Exception {
        pictMapper.today_delete(pictVO);
    }


    @Override
    public List<?> review_list(PictVO pictVO) throws Exception {
        return pictMapper.review_list(pictVO);
    }

    @Override
    public PictVO review_list_one(PictVO pictVO) throws Exception {
        return pictMapper.review_list_one(pictVO);
    }

    @Override
    public void review_update(PictVO pictVO) throws Exception {
        pictMapper.review_update(pictVO);
    }

    @Override
    public void review_insert(PictVO pictVO) throws Exception {
        pictMapper.review_insert(pictVO);
    }

    @Override
    public void review_delete(PictVO pictVO) throws Exception {
        pictMapper.review_delete(pictVO);
    }


    @Override
    public List<?> popup_list(PictVO pictVO) throws Exception {
        return pictMapper.popup_list(pictVO);
    }

    @Override
    public PictVO popup_list_one(PictVO pictVO) throws Exception {
        return pictMapper.popup_list_one(pictVO);
    }

    @Override
    public void popup_update(PictVO pictVO) throws Exception {
        pictMapper.popup_update(pictVO);
    }

    @Override
    public void popup_insert(PictVO pictVO) throws Exception {
        pictMapper.popup_insert(pictVO);
    }

    @Override
    public void popup_delete(PictVO pictVO) throws Exception {
        pictMapper.popup_delete(pictVO);
    }

    @Override
    public void user_insert(PictVO pictVO) throws Exception {
        pictMapper.user_insert(pictVO);
    }
	
	
}
