from prefect import flow, task

@task
def test():
    return 0


@flow
def call():
    return test()


if __name__ == '__main__':
    call()