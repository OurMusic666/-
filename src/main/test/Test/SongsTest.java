package Test;

import java.util.ArrayList;

import com.music.Team.bean.Album;
import com.music.Team.bean.Music;
import com.music.Team.bean.MusicInfo;
import com.music.Team.bean.Singer;
import com.music.Team.biz.Impl.AlbumBizImpl;
import com.music.Team.biz.Impl.MusicBizImpl;
import com.music.Team.biz.Impl.SingerBizImpl;
import com.music.Team.util.SongsBuilder;

public class SongsTest {

	public static void main(String[] args) {
		SongTest();
	}
	
	public static void SongTest() {
		ArrayList<MusicInfo> musicInfos=SongsBuilder.getMusic("e:\\Three\\mu");
		
		Singer singer=new Singer();
		Album album=new Album();
		Music music=new Music();
		
		singer.setSinger_name(musicInfos.get(0).getSinger());
		singer.setSinger_pic("1");
		singer.setSinger_desc("123");
		
		SingerBizImpl singerBizImpl=new SingerBizImpl();
		singerBizImpl.insert(singer);
		System.out.println("歌手插入成功");
		
		album.setAlbum_name(musicInfos.get(0).getAlbum());
		album.setSinger_id(singerBizImpl.select().getSinger_id());
		
		AlbumBizImpl albumBizImpl=new AlbumBizImpl();
		albumBizImpl.insert(album);
		System.out.println("专辑插入成功");
		
		music.setMusic_name(musicInfos.get(0).getName());
		music.setSinger_id(singerBizImpl.select().getSinger_id());
		music.setAlbum_id(albumBizImpl.select().getAlbum_id());
		music.setMusic_lyr("??");
		music.setMusic_isMember(1);
		
		MusicBizImpl musicBizImpl=new MusicBizImpl();
		musicBizImpl.insert(music);
		System.out.println("音乐插入成功");
	}
	
}	
