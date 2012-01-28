module NavigationHelper
  def navigation_for(name)
    navigation = Navigation.where(:name => name).first
    items = []
    navigation.navigation_items.roots.all.each do |navigation_item|
      items << build_navigation(navigation_item)  
    end
    
    if navigation.level.empty?
      render_navigation :items => items, :expand_all => navigation.expand
    else
      render_navigation :items => items, :expand_all => navigation.expand, :level => eval(navigation.level)
    end  
  end
  
  def build_navigation(navigation_item)
    if navigation_item.children.count > 0
      items = []
      navigation_item.children.each do |child|
        items << build_navigation(child)
      end
      return {:key => navigation_item.key, :name => navigation_item.name, :url => eval(navigation_item.url), :items => items }
    else  
      return {:key => navigation_item.key, :name => navigation_item.name, :url => eval(navigation_item.url) }
    end
  end
end
