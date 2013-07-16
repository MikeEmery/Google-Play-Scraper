require 'spec_helper'

describe GooglePlayScraper::Search do
  context 'searching' do
    it 'should be able to search for angry birds' do
      search = GooglePlayScraper::Search.new('Angry Birds')
      results = search.run
      results.size.should == 10
      results.first.name.should == 'Angry Birds'
      results.first.developer.should == 'Rovio Mobile Ltd.'
      results.first.id.should == 'com.rovio.angrybirds'
      results.first.logo_url.should == 'https://lh6.ggpht.com/M9q_Zs_CRt2rbA41nTMhrPqiBxhUEUN8Z1f_mn9m89_TiHbIbUF8hjnc_zwevvLsRIJy=w340'
      results.first.logo_url_small.should == 'https://lh6.ggpht.com/M9q_Zs_CRt2rbA41nTMhrPqiBxhUEUN8Z1f_mn9m89_TiHbIbUF8hjnc_zwevvLsRIJy=w170'
      results.first.url.should == 'https://play.google.com/store/apps/details?id=com.rovio.angrybirds'
    end
    
    it 'should be able to search for the sparq.me scanner' do
      search = GooglePlayScraper::Search.new('SPARQ.ME')
      results = search.run
      results.size.should == 1
      results.first.name.should == 'SPARQ.ME'
      results.first.developer.should == 'MSKYNET, Inc.'
      results.first.id.should == 'com.sparqcode.sparqeye.android'
      results.first.logo_url.should == 'https://lh3.ggpht.com/m8vHSrnD8kqMpYkgyQDxWpren2Pi5Vn-Eemj-xyHwcGUsbsi0rcYy0dR5Qzi5B566ig=w340'
      results.first.logo_url_small.should == 'https://lh3.ggpht.com/m8vHSrnD8kqMpYkgyQDxWpren2Pi5Vn-Eemj-xyHwcGUsbsi0rcYy0dR5Qzi5B566ig=w170'
      results.first.url.should == 'https://play.google.com/store/apps/details?id=com.sparqcode.sparqeye.android'
    end
    
    it 'should be able to find keek' do
      search = GooglePlayScraper::Search.new('Keek')
      results = search.run
      results.size.should == 10
      results.first.name.should == 'Keek - Social Video'
      results.first.developer.should == 'Keek Inc.'
      results.first.id.should == 'com.keek'
      results.first.logo_url.should == 'https://lh3.ggpht.com/SJSSPnOXBAQuz3miopva-ECfwz7YZJkaeTnIGPIYXxF6TCQ393_p1DAEtiEtfeUhDoOu=w340'
      results.first.logo_url_small.should == 'https://lh3.ggpht.com/SJSSPnOXBAQuz3miopva-ECfwz7YZJkaeTnIGPIYXxF6TCQ393_p1DAEtiEtfeUhDoOu=w170'
      results.first.url.should == 'https://play.google.com/store/apps/details?id=com.keek'
    end
  end
end