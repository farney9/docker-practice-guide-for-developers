const { syncDb } = require('../../tasks/sync-db');

describe('Tests in syncDb', () => {

  test('Debe ejecutar el proceso 2 veces', () => {
    syncDb();
    const times = syncDb();
    expect(times).toBe(2);
  });
<<<<<<< HEAD
});
=======
});
>>>>>>> 4dd6ef8 (Add tests with Jest)
