package example.infrastructure.datasource.product.kit;

import example.application.repository.StarterKitRepository;
import example.domain.identity.KitNumber;
import example.domain.model.product.StarterKit;
import example.domain.model.product.StarterKitList;
import example.infrastructure.datasource.product.feature.FeatureMapper;
import example.infrastructure.datasource.product.row.RowMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StarterKitDatasource implements StarterKitRepository {

    StarterKitMapper starterKitMapper;
    FeatureMapper featureMapper;
    RowMapper rowMapper;

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    public StarterKitDatasource(StarterKitMapper starterKitMapper, FeatureMapper featureMapper, RowMapper rowMapper) {
        this.starterKitMapper = starterKitMapper;
        this.featureMapper = featureMapper;
        this.rowMapper = rowMapper;
    }

    @Override
    public StarterKitList listAll() {
        List<StarterKit> result = starterKitMapper.listAll();
        if (result == null) return StarterKitList.empty();
        return StarterKitList.from(result);
    }

    @Override
    public StarterKit findBy(KitNumber kitNumber) {
        return starterKitMapper.findBy(kitNumber);
    }

    @Override
    public void register(StarterKit starterKit) {
        starterKitMapper.register(starterKit);
        if (starterKit.hasFeatures()) featureMapper.recordFeatures(starterKit);
        rowMapper.recordRows(starterKit);
    }
}
