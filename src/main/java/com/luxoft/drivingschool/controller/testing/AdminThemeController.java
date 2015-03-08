package com.luxoft.drivingschool.controller.testing;


import com.luxoft.drivingschool.model.testing.Theme;
import com.luxoft.drivingschool.service.testing.ThemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/admin/testing/theme")
@Controller
public class AdminThemeController {

    private static final String VIEW_SEARCH_PATH = "admin/testing/theme/search";
    private static final String VIEW_SHOW_PATH = "admin/testing/theme/show";
    private static final String VIEW_EDIT_PATH = "admin/testing/theme/edit";
    private static final String REDIRECT_SHOW_TO_ID_PATH = "redirect:show?id=";

    private static final String SEARCH_MAPPING_PATH="/search";
    private static final String ADD_MAPPING_PATH="/add";
    private static final String SAVE_MAPPING_PATH="/save";
    private static final String SHOW_MAPPING_PATH="/show";
    private static final String EDIT_MAPPING_PATH="/edit";

    private static final String THEMES_ATTRIBUTE="themes";
    private static final String THEME_ATTRIBUTE="theme";

    private static final String ID_REQUEST_PARAM="id";

    @Autowired
    private ThemeService themeService;

    @RequestMapping(value = SEARCH_MAPPING_PATH, method = RequestMethod.GET)
    public String showAllThemes(Model model) {

        model.addAttribute(THEMES_ATTRIBUTE, themeService.findAll());
        return VIEW_SEARCH_PATH;
    }

    // Переход на форму сохранения
    @RequestMapping(value = ADD_MAPPING_PATH, method = RequestMethod.GET)
    public String showRegistration(Model model) {

        model.addAttribute(THEME_ATTRIBUTE, new Theme());

        return VIEW_EDIT_PATH;
    }

    // Сохранение и переход на форму просмотра
    @RequestMapping(value = SAVE_MAPPING_PATH, method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute(THEME_ATTRIBUTE) Theme theme) {
        theme = themeService.save(theme);
        return REDIRECT_SHOW_TO_ID_PATH + theme.getId(); // На страничку просмотра
    }

    // Показ одной темы
    @RequestMapping(value = SHOW_MAPPING_PATH, method = RequestMethod.GET)
    public String show(@RequestParam(ID_REQUEST_PARAM) long id, Model model) {

        model.addAttribute(THEME_ATTRIBUTE, themeService.findOne(id));
        return VIEW_SHOW_PATH;
    }

    // Редактирование одной темы
    @RequestMapping(value = EDIT_MAPPING_PATH, method = RequestMethod.GET)
    public String edit(@RequestParam(ID_REQUEST_PARAM) long id, Model model) {

        model.addAttribute(THEME_ATTRIBUTE, themeService.findOne(id));

        return VIEW_EDIT_PATH;
    }
}
